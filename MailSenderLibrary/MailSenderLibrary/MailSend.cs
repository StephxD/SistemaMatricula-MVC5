using MailKit.Net.Smtp;
using MimeKit;

namespace MailSenderLibrary
{
    public class MailSend
    {
        public void SendEmail(MailStruct mailStruct)
        {
            var email = new MimeMessage();

            email.From.Add(new MailboxAddress(mailStruct.varfrom, mailStruct.varfrom));
            email.To.Add(new MailboxAddress(mailStruct.varto, mailStruct.varto));

            email.Subject = mailStruct.varsubject;
            email.Body = new TextPart(MimeKit.Text.TextFormat.Html)
            {
                Text = mailStruct.varbody
            };

            using (var smtp = new SmtpClient())
            {
                smtp.Connect(mailStruct.varemailserver, mailStruct.varport, mailStruct.varssl);
                smtp.Authenticate(mailStruct.varusername, mailStruct.varpassword);
                smtp.Send(email);
                smtp.Disconnect(true);
            }
        }
    }
}
