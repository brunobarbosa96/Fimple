using System;

namespace Exemplo.ViewModels
{
    public class Usuario
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime Birth { get; set; }

        public string DataNascimento => Birth.ToShortDateString();
    }
}