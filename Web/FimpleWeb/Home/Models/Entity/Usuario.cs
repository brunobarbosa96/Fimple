using System;
using System.Collections.Generic;

namespace Home.Models.Entity
{
    public class Usuario
    {
        public Usuario()
        {
            ConnectionIds = new List<string>();
        }

        public int Id { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar senha")]
        public string Senha { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar rgm")]
        public int Rgm { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar nome")]
        public string Nome { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar sobrenome")]
        public string Sobrenome { get; set; }
        public string Apelido { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar e-mail")]
        public string Email { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar data de nascimento")]
        public DateTime DataNascimento { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar data de início do curso")]
        public DateTime DataInicioCurso { get; set; }
        public int Cep { get; set; }
        public DateTime DataUltimoAcesso { get; set; }
        //[Required(ErrorMessage = "Obrigatório informar curso")]
        public Curso Curso { get; set; }
        public IEnumerable<Usuario> UsuariosBloqueados { get; set; }

        public List<string> ConnectionIds { get; set; }

        public byte? Lembrar { get; set; }
        public IEnumerable<Curso> ComboCurso { get; set; }

        public string NomeCompleto => $"{Nome} {Sobrenome}";
        public string NomeDataNascimento => $"{DataNascimento.ToShortDateString()}";
        public string NomeDataInicioCurso => $"{DataInicioCurso.ToShortDateString()}";
    }
}