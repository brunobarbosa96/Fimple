using System;

namespace Commom.Entity
{
    public static class UsuarioLogado
    {
        public static int Id { get; set; }
        public static string Senha { get; set; }
        public static int Rgm { get; set; }
        public static string Nome { get; set; }
        public static string Sobrenome { get; set; }
        public static string Apelido { get; set; }
        public static string Email { get; set; }
        public static DateTime DataNascimento { get; set; }
        public static DateTime DataInicioCurso { get; set; }
        public static int IdCurso { get; set; }
        public static string NomeCurso { get; set; }

        public static string NomeUsuario => string.IsNullOrEmpty(Apelido) ? $"{Nome} {Sobrenome}" : Apelido;
    }
}