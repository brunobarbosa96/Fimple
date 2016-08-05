using System;

namespace Home.Models.Entity
{
    public class Usuario
    {
        public int IdUsuario { get; set; }
        public string Senha { get; set; }
        public int Rgm { get; set; }
        public string Nome { get; set; }
        public string Sobrenome { get; set; }
        public string Apelido { get; set; }
        public string Email { get; set; }
        public DateTime DataNascimento { get; set; }
    }
}