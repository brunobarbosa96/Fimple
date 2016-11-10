using System;

namespace Home.Models.Entity
{
    public class Mensagem
    {
        public Mensagem()
        {
            
        }

        public Mensagem(string conteudo, Usuario usuarioEnvio, int idUsuarioDestino)
        {
            Conteudo = conteudo;
            UsuarioEnvio = usuarioEnvio;
            UsuarioDestino = new Usuario { Id = idUsuarioDestino };
        }

        public int Id { get; set; }
        public string Conteudo { get; set; }
        public DateTime DataEnvio { get; set; }
        public DateTime? DataRecebimento { get; set; }
        public DateTime? DataVisualizacao { get; set; }
        public Usuario UsuarioEnvio { get; set; }
        public Usuario UsuarioDestino { get; set; }

        public DateTime updateAt { get; set; }
        public string HoraEnvio => $"{updateAt:HH:mm}";
    }
}