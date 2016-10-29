using System;
using System.Collections.Generic;

namespace Home.Models.Entity
{
    public class Evento
    {
        public int Id { get; set; }
        public string Descricao { get; set; }
        public string Local { get; set; }
        public DateTime Data { get; set; }
        public Usuario Usuario { get; set; }
        public IEnumerable<Usuario> Participantes { get; set; }
        public IEnumerable<Comentario> Comantarios { get; set; }
    }
}