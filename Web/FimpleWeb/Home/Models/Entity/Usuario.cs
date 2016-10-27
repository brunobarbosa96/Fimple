using System;
using System.Collections.Generic;

namespace Home.Models.Entity
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Senha { get; set; }
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
    }
}