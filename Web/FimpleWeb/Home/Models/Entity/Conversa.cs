using System;

namespace Home.Models.Entity
{
    public class Conversa
    {
        public int Id { get; set; }
        public DateTime Data { get; set; }
        public bool Ativo { get; set; }
        public Usuario Remetente { get; set; }
        public Usuario Destino { get; set; }
    }
}