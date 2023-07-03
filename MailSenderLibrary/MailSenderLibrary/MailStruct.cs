using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MailSenderLibrary
{
    public class MailStruct
    {
        public string varemailserver { get; set; }
        public string varusername { get; set; }
        public string varpassword { get; set; }
        public string varfrom { get; set; }
        public string varto { get; set; }
        public string varsubject { get; set; }
        public string varbody { get; set; }
        public int varport { get; set; }
        public bool varssl { get; set; }
    }
}
