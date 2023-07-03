using System.IO;
using System.Threading;
using System.ServiceProcess;
using System;
using System.Configuration;
using System.Data;
using System.Linq;
using MailSenderLibrary;

namespace MailSenderService
{
    public partial class MailSenderService : ServiceBase
    {

        SistemaMatriculaEntities db = new SistemaMatriculaEntities();
        public MailSenderService()
        {
            InitializeComponent();
        }


        protected override void OnStart(string[] args)
        {
            this.WriteToFile("MailSenderService started {0}");
            this.ScheduleService();
        }

        protected override void OnStop()
        {
            this.WriteToFile("MailSenderService stopped {0}");
            this.Schedular.Dispose();
        }

        private Timer Schedular;

        public void ScheduleService()
        {
            try
            {
                Schedular = new Timer(new TimerCallback(SchedularCallback));
                DateTime scheduledTime = DateTime.MinValue;
                    int intervalMinutes = Int32.Parse(ConfigurationManager.AppSettings["IntervalMinutes"]); ;
                    scheduledTime = DateTime.Now.AddMinutes(intervalMinutes);

                    if (DateTime.Now > scheduledTime)
                    {
                        scheduledTime = scheduledTime.AddMinutes(intervalMinutes);
                    }

                TimeSpan timeSpan = scheduledTime.Subtract(DateTime.Now);
                int dueTime = Convert.ToInt32(timeSpan.TotalMilliseconds);
                Schedular.Change(dueTime, Timeout.Infinite);
            }
            catch (Exception ex)
            {
                WriteToFile("MailSenderService Error on: {0} " + ex.Message + ex.StackTrace);
                using (System.ServiceProcess.ServiceController serviceController = new System.ServiceProcess.ServiceController("SimpleService"))
                {
                    serviceController.Stop();
                }
            }
        }

        private void SchedularCallback(object e)
        {
            this.SendEmail();
            this.ScheduleService();
        }

        private void WriteToFile(string text)
        {
            string path = ConfigurationManager.AppSettings["PATH"].ToString();
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(string.Format(text, DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt")));
                writer.Close();
            }
        }
        
        private void SendEmail()
        {
            this.WriteToFile("Reading pending Emails to send: {0}");
            var Lst = db.sp_RetornaCorreosPendientes().ToList();

            if (Lst.Count() > 0)
            {
                this.WriteToFile("Processing Emails to send " + Lst.Count() + " : {0}");
                foreach (var EmailObject in Lst)
                {
                    try
                    {
                        MailSend miCorreo = new MailSend();
                        MailStruct paramcorreo = new MailStruct();

                        paramcorreo.varemailserver = ConfigurationManager.AppSettings["smtpServer"];
                        paramcorreo.varusername = ConfigurationManager.AppSettings["stmpUserName"];
                        paramcorreo.varpassword = ConfigurationManager.AppSettings["stmpPassword"];
                        paramcorreo.varport = int.Parse(ConfigurationManager.AppSettings["stmpPort"]);
                        paramcorreo.varssl = bool.Parse(ConfigurationManager.AppSettings["stmpSSL"]);

                        paramcorreo.varfrom = ConfigurationManager.AppSettings["stmpUserName"];
                        paramcorreo.varto = EmailObject.Destinatario;
                        paramcorreo.varsubject = EmailObject.Asunto;
                        paramcorreo.varbody = EmailObject.Cuerpo;
                        miCorreo.SendEmail(paramcorreo);

                        this.WriteToFile(EmailObject.Destinatario);
                        this.WriteToFile(EmailObject.Asunto);
                        this.WriteToFile(EmailObject.Cuerpo);

                        db.sp_ActualizaCorreo(EmailObject.id_Envio, "S", "Correo enviado sin errores");
                        this.WriteToFile("Email Sent: {0}");
                    }
                    catch (Exception ex)
                    {
                        WriteToFile("MailSenderService Error on: {0} " + ex.Message + ex.StackTrace);
                        db.sp_ActualizaCorreo(EmailObject.id_Envio, "X", ex.Message + " " + ex.StackTrace);
                    }
                }
            }
            else
            {
                this.WriteToFile("Processing Emails to send " + Lst.Count() + " : {0}");
            }
        }
    }
}
