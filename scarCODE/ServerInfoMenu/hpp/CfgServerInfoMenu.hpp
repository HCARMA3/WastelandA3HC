class CfgServerInfoMenu
{
   addAction = 0; // Enable/disable action menu item | use 0 to disable | default: 1 (enabled)
//   antiHACK = "infiSTAR + BattlEye";
   antiHACK = "BattlEye";
   hostedBy = "Mgthost1";
   ipPort = "189.1.169.221:2342";
   openKey = "User7"; // https://community.bistudio.com/wiki/inputAction/actions
   openAtLogin = no;
   restart = 3; // Amount of hours before server automatically restarts
   serverName = "HC Corp A3Wasteland Altis";
   class menuItems
   {
      // title AND content accept formatted text ( since update Oct5.2016 )
          class first
      {
         menuName = "Rules";
         title = "Regras do servidor|Server rules";
         content[] = {
            "<t size='1.70'>Regras do servidor A3Wasteland Altis <t color='#b8870a'>HC Corp</t>|<t color='#b8870a'>HC Corp</t> A3Wasteland Altis server rules</t><br />",
            "1. É proibido o uso de cheats, exploits e/ou hacks. Penalidade: <t color='#ff0000'>banimento</t><br />",
            "1. Using cheats, exploits and/or hacks is forbidden. Penalty: <t color='#ff0000'>ban</t><br />",
            "2. Seja educado. Respeite o servidor, os administradores, os membros da HC Corp e todos os outros jogadores. Penalidades: primeira ofensa; aviso; ofensas seguintes; <t color='#ff0000'>banimento</t><br />",
            "2. Be polite. Respect the server, the administrators, the HC Corp members and all the other players. Penalties: first offense; warning; following offenses; <t color='#ff0000'>ban</t><br />"

         };
      };
      class second
      {
         menuName = "Missions";
         title = "<t color='#b8870a'>Missões do servidor|Server missions</t>";
         content[] = {
            "<br/>• Small Money Shipment: $50,000<br />• Medium Money Shipment: $75,000<br />• Large Money Shipment: $100,000<br />• Heavy Money Shipment: $150,000<br />• Sunken Treasure: $150,000<br /></p>"
         };
      };
      class third
      {
         menuName = "Events";
         title = "<t color='#b8870a'>Eventos todo fim de semana|Events every weekend</t>";
         content[] = {"<t size='1.75'>Próximo evento|Next event</t><br />• NÃO DISPONÍVEL|NOT AVAILABLE<br />"};
      };
      class fourth
      {
         menuName = "Admins";
         title = "<t color='#b8870a'>Administradores|Administrators</t>";
         content[] = {"<t size='1.75'>Admin</t><br /><t color='#b8870a'>• leonbarba<br />• rover047</t><br />"};
//         content[] = {"<t size='1.75'>Admin</t><br /><t color='#b8870a'>• NICK 1<br />• NICK 2 <br />• NICK 3</t><br />",
//            "<t size='1.75'>Editor</t><br /><t color='#b8870a'>• NICK 1<br />• NICK 2</t><br />"};
      };
//      class fifth
//      {
//         menuName = "Rank";
//         title = "<t color='#b8870a'>Top 10</t>";
//         content[] = {"<t size='1.75'>Rank</t><br />• EM BREVE|SOON<br />"};
//      };
//      class sixth
      class fifth
      {
         menuName = "Communication";
         title = "<t color='#b8870a'>Servidor de voz|Voice server</t>";
         content[] = {
            "<t size='1.75'>TeamSpeak:</t><br /><t color='#b8870a'><a href='http://invite.teamspeak.com/192.99.182.72/?port=32104'>192.99.182.72:32104</a></t><br />"
         };
      };
//      class seventh
//      {
//         menuName = "Updates";
//         title = "<t color='#b8870a'>Atualiza&ccedil;&otilde;es|Updates</t>";
//         content[] = {
//            "<t size='1.75'>Atualiza&ccedil;&otilde;es|Updates</t><br /><t color='#b8870a'><a href='http://www.hccorp.com.br'>www.hccorp.com.br</a></t><br />"
//         };
//      };
   };
};
