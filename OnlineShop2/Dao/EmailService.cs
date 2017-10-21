using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using OnlineShop.Models;
using System.Threading.Tasks;

namespace OnlineShop.Dao
{
    public class EmailService
    {
        public async static Task SendContactFrom(Contact contactForm)
        {
            string body = "<p>The following is a message from {0} ({1})</p><p>{2}</p>";
            MailMessage message = new MailMessage();
            message.To.Add(new MailAddress("kiet.tran@cartek.com.vn"));
            message.Subject = contactForm.Subject;
            message.Body = string.Format(body, contactForm.YourName, contactForm.Email, contactForm.Message);
            message.IsBodyHtml = true;

            using(SmtpClient smtpClient = new SmtpClient())
            {
                await smtpClient.SendMailAsync(message);
            }
        }
    }
}