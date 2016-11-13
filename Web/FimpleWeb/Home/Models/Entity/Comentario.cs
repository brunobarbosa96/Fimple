using System;

namespace Home.Models.Entity
{
    public class Comentario
    {
        public int Id { get; set; }
        public string Conteudo { get; set; }
        public Usuario Usuario { get; set; }
        public int? IdPublicacao { get; set; }

        public DateTime updatedAt { get; set; }
    }
}