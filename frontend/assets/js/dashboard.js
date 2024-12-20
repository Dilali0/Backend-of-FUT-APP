let DataPlayer = [];
let DataClubs = [];
let DataNationality = [];

document.addEventListener("DOMContentLoaded", () => {
     fetchdata();
  });

  const bodyTable = document.getElementById('body_table_dash');
  const cardPlayers = document.getElementById('count-players');
  const cardClubs = document.getElementById('count-clubs');
  const cardNationality = document.getElementById('count-nationality');
  const photo = document.getElementById('photo');
  const face = document.getElementById('face');
  const comboNatio = document.getElementById('flag');
  const comboClub = document.getElementById('club'); 
  const forumularUpdate= document.getElementById('formulaire');

  function fetchdata(){
    fetch('http://localhost/index.php?name=bgght&')
    .then((response) => response.json())
    .then((data) => {
      console.log(data.data);
      DataPlayer = Array.from(data.data);
      localStorage.setItem("DataP" , JSON.stringify(DataPlayer))
      cardPlayers.textContent = data.statsPlayers[0].Players_count  ;
      cardClubs.textContent = data.statsClub[0].Clubs_count  ;
      cardNationality.textContent = data.statsNatio[0].Natio_count  ;
       DataNationality = Array.from(data.nationality);
            DataClubs = Array.from(data.clubs);
            console.log(DataClubs);
            console.log(DataNationality);
            
            DataNationality.forEach((natio) => {
                comboNatio.innerHTML += `<option value="${natio.Nat_id}">${natio.Nat_nom}</option>`;
            });

            DataClubs.forEach((clb) => {
                comboClub.innerHTML += `<option value="${clb.club_id}">${clb.club_nom}</option>`;
            });
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
                <button onclick="transfaire(${Player.id},'${Player.Photo}','${Player.nom}','${Player.positionn}','${Player.club_id}','${Player.Nat_id}','${Player.rating}','${Player.diving_pace}','${Player.diving_pace}','${Player.kicking_passing}','${Player.reflexes_dribbling}','${Player.speed_defending}','${Player.positioning_physical}')" class="fas fa-edit update" title="Update"> </button>
                <i ></i>
                <button  onclick="delet(${Player.id})" class="fas fa-trash delete"  title="Delete"> </button>
             </td>
          </tr>
        `
      });
    }) 
  }
let idplayer ;
  function transfaire(id,Photo,nom,positionn,club_id,Nat_id,rating,diving_pace,handling_shooting,kicking_passing,reflexes_dribbling,speed_defending,positioning_physical){
    idplayer = id ;
    document.getElementById('name').value = nom ;
    document.getElementById('position').value = positionn  ; 
    document.getElementById('face').setAttribute('src', Photo ) ;
    document.getElementById('club').value = club_id ;
    document.getElementById('flag').value = Nat_id  ;
    document.getElementById('rating').value = rating  ;
    document.getElementById('pace').value = diving_pace ;
    document.getElementById('shooting').value = handling_shooting ;
    document.getElementById('passing').value = kicking_passing ;
    document.getElementById('dribbling').value = reflexes_dribbling ;
    document.getElementById('physical').value = positioning_physical;
    document.getElementById('defending').value = speed_defending ;

}

photo.addEventListener('change', (event) => {
  const file = event.target.files[0];
  if (file) {
      const reader = new FileReader();
      reader.onload = function (e) {
          face.src = e.target.result;
      };
      reader.readAsDataURL(file);
  }
});


forumularUpdate.addEventListener('submit', async (e)=>{

        e.preventDefault();
        const Updateinfoplayer = {
          id : idplayer ,
          nom : document.getElementById('name').value,
          position: document.getElementById('position').value,
          photo: document.getElementById('face').getAttribute('src'),
          club : document.getElementById('club').value ,
          Nationality : document.getElementById('flag').value,
          rating : document.getElementById('rating').value ,
          pace_diving : document.getElementById('pace').value ,
          shooting_handling : document.getElementById('shooting').value,
          passing_kicking : document.getElementById('passing').value,
          dribbling_reflexes : document.getElementById('passing').value,
          defending_speed :document.getElementById('defending').value,
          physical_positioning : document.getElementById('physical').value,
          edit : true
      }
      const response = await fetch('http://localhost/index.php',{
               method : 'PUT',
               headers: { "Content-Type": "application/json" },
               body: JSON.stringify(Updateinfoplayer)

      })

      const data = await response.json();
      console.log(data);
      
      console.log('hani khdemt al batal');
      
})


async function delet(id){
  const idplayer = {idplayer : id}
  response = await fetch('http://localhost/index.php',{
    method : 'DELETE',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(idplayer)
  }
  )
}