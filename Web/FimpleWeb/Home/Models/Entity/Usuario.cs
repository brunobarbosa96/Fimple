using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Home.Models.Entity
{
    public class Usuario
    {
        public int Id { get; set; }
        [Required]
        public string Senha { get; set; }
        [Required]
        public int Rgm { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public string Apelido { get; set; }
        public string Email { get; set; }
        public DateTime DataNascimento { get; set; }
        public DateTime DataInicioCurso { get; set; }
        public int Cep { get; set; }
        public DateTime DataUltimoAcesso { get; set; }
        public Curso Curso { get; set; }
        public IEnumerable<Usuario> UsuariosBloqueados { get; set; }

        public string ConnectionId { get; set; }

        public byte? Lembrar { get; set; }
        public IEnumerable<Curso> ComboCurso { get; set; }


    }
}