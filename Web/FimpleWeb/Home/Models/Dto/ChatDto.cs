﻿using Home.Models.Entity;
using System.Collections.Generic;
using System.Linq;

namespace Home.Models.Dto
{
    public class ChatDto
    {
        public ChatDto()
        {
            
        }

        public ChatDto(Usuario usuario, IEnumerable<Mensagem> conversas)
        {
            Usuario = usuario;
            Usuarios = conversas.Select(x => new Mensagem
            {
                UsuarioDestino = x.UsuarioDestino.Id != usuario.Id ? x.UsuarioDestino : x.UsuarioEnvio
            }).GroupBy(x => x.Id).Distinct();
        }

        public Usuario Usuario { get; set; }
        public IEnumerable<Mensagem> Conversas { get; set; }
        public IEnumerable<IGrouping<int, Mensagem>> Usuarios { get; set; }
    }
}