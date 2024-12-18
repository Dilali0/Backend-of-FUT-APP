let DataPlayer = [];
document.addEventListener("DOMContentLoaded", () => {
     fetchdata();
  });

  const bodyTable = document.getElementById('body_table_dash');
  const cardPlayers = document.getElementById('count-players');
  const cardClubs = document.getElementById('count-clubs');
  const cardNationality = document.getElementById('count-nationality');

  function fetchdata(){
    fetch('http://localhost/test.php?name=bgght&')
    .then((response) => response.json())
    .then((data) => {
      console.log(data.data);
      DataPlayer = Array.from(data.data);
      localStorage.setItem("DataP" , JSON.stringify(DataPlayer))
      cardPlayers.textContent = data.statsPlayers[0].Players_count  ;
      cardClubs.textContent = data.statsClub[0].Clubs_count  ;
      cardNationality.textContent = data.statsNatio[0].Natio_count  ;
      DataPlayer.forEach(Player => {
        bodyTable.innerHTML += `
         <tr style="text-align: center;">
                                      <td class="player-name" >
                                      <img src="${Player.Photo}" alt="${Player.nom}" width="50px" height="50px">
                                      <div class="info_column">
                                        <p>${Player.nom}</p>
                                        <div class="info-fl"><img src="${Player.club_logo}" alt="${Player.club_nom}" width="20px" height="20px"> <img src="${Player.Nat_flag}" alt="${Player.Nat_nom}" width="20px" height="15px"></div>
                                      </div>
                                      </td>
                                      <td class="position">${Player.positionn}</td>
                                      <td class="rating">${Player.rating}</td>
                                      <td class="status">${Player.statu}</td>
                                      <td class="pac-rand">${Player.diving_pace}</td>
                                      <td class="sho-div">${Player.diving_pace}</td>
                                       <td class="pas-kick">${Player.kicking_passing}</td>
                                       <td class="dri-ref">${Player.reflexes_dribbling}</td>
                                       <td class="def-spd">${Player.speed_defending}</td>
                                       <td class="phy-pos">${Player.positioning_physical}</td>
                                       <td class="action-buttons">
                                        <i class="fas fa-edit update" title="Update"></i>
                                        <i class="fas fa-trash delete" title="Delete"></i>
                                      </td>
                                   </tr>
        `
      });
    }) 
  }
