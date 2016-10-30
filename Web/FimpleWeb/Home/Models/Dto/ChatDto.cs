using Home.Models.Entity;
using System.Collections.Generic;

namespace Home.Models.Dto
{
    public class ChatDto
    {
        public Usuario Usuario { get; set; }
        public IEnumerable<Conversa> Conversas { get; set; }
    }
}