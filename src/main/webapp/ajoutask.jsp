<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="beans.Uticonnexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="beans.Handler" %>
<%@ page import="beans.LowPriorityHandler" %>
<%@ page import="beans.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    <style>
        body{
            background-image:url("images/image.jpg");
            font-size:large ;
            background-size: cover;

        }

        .mask-custom {
            backdrop-filter: blur(5px);
            background-color: rgba(255, 255, 255, .15);
        }

        .navbar-brand {
            font-size: 1.75rem;
            letter-spacing: 3px;
        }
        .navbar-nav {
            margin-left:1000px;
            color: #044184;
        }
        .nav-item:hover{
            color: #DAAB54;
        }
        .trello{

            display: grid;
            grid-template-rows: 1fr;
            grid-template-columns: repeat(auto-fit,250px);
            grid-gap: 20px;
        }
        .trello__list{
            background-color: #d6d5d5;
            border-radius: 25px;
            align-self: start;
            padding: 5px;
        }
        .trello__list__item{
            background-color: white;
            background: white;
            display: grid;
            border-radius: 10px;
            margin: 7px;
            padding: 5px;
        }
        .highlighted{
            background-color: #A7CAD1;
            width: 30px;
            color: white;
            border-radius: 4px;
            padding: 2px;
            font-size: small;
            margin-top: 2px;
        }
        .title{
            background-color:#DAAB54;
            width: 100px;
            color: white;
            border-radius: 4px;
            padding: 2px;
            font-size: small;
            margin-top: 2px;
        }
        .nv-task{
            background-color:#A7CAD1;
            color:#044184 ;
            border: #A7CAD1;
            font-size:large;

        }

        .material-symbols-outlined circle{
            background-color: #044184;
            font-size: 55px;
            color:#A7CAD1 ;
            border-radius: 50%;


        }
        .material-icons.md-60 { font-size: 150px; }
        .title_container{
            font-size:large;
            margin-left:20px;
            color:#044184;
            font-weight: 600;

        }
        .type-task{
            background-color: #A7CAD1;
            display: grid;
            border-radius: 10px;
            margin: 7px;
            padding: 5px;
        }
        .type{
            background-color:#c94135;
            width: 100px;
            color: white;
            border-radius: 4px;
            padding: 2px;
            font-size: small;
            margin-top: 2px;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top mask-custom shadow-0">
        <div class="container">
            <a class="navbar-brand" href="#!"><span style="color: #5e9693;">MY</span><span style="color: #fff;">TODO</span></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#!">Aceuil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#!">Deconnexion</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

</div>


<br>
<br>
<br>




<%
    Handler lowPriorityHandler = new LowPriorityHandler();
    Handler mediumPriorityHandler = new MediumPriorityHandler();
    Handler highPriorityHandler = new HighPriorityHandler();
    lowPriorityHandler.setNextHandler(mediumPriorityHandler);
    mediumPriorityHandler.setNextHandler(highPriorityHandler);
%>
<div>
    <div  id="container" class="trello">
        <div class="trello__list">
            <span class="title_container">Title</span>
            <div class="type-task">
                <center> <span class="type">Important</span></center>
                <div class="trello__list__item">
                    <span class="title">Titre du task</span>
                    <span>CSS is so good.</span>
                    <span class="highlighted">CSS</span>
                </div>
            </div>
            <div class="trello__list__item">
                <span class="title">Titre du task</span>
                <span>GFG is great site to learn new things.</span>
                <span class="highlighted">GFG</span>
            </div>
            <div class="trello__list__item">
                <span class="title">Titre du task</span>
                <span>I like to write code in HTML,CSS.</span>
            </div>
            <center><button class="rounded-3 nv-task"  data-bs-toggle="modal" data-bs-target="#nv-task">Nouveau task</button></center>
        </div>
    </div>
</div>
<div class="modal fade" id="nv-task" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="formulaire" id="formulaire">

                    <form>
                        <label>Ajouter le titre du task</label>
                        <input  type="text" class="title-task" id="title-task" name="title-task" ><br>
                        <label>Description du task</label>
                        <input  type="text"  class="title-task" id="desc-task" name="title-task" ><br>
                        <label>Ajouter la préorité du task</label><br>
                        <center><input type="radio" id="important" name="important" value="important">
                            <label for="important">Important</label><br>
                            <input type="radio" id="moyen" name="moyen" value="moyen">
                            <label for="moyen">Moyen</label><br>
                            <input type="radio" id="pas_important" name="pas_important" value="pas_important">
                            <label for="pas_important">Pas important</label><br></center>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ajouter</button>
            </div>
        </div>
    </div>
</div>

<!--<div class="formulaire" id="formulaire">

  <form>
      <label>Ajouter le titre du task</label>
      <input  type="text" id="title-task" name="title-task" >
      <label>Description du task</label>
      <input  type="text" id="title-task" name="title-task" >
      <label>Ajouter la préorité du task</label><br>
      <label for="Importante">Important</label>
      <input type="radio" id="important" name="important" value="important">
      <label for="moyen">Moyen</label>
      <input type="radio" id="moyen" name="moyen" value="moyen">
      <label for="pas_important">Pas important</label>
      <input type="radio" id="pas_important" name="pas_important" value="pas_important">
      <button class="ajouter">Ajouter task</button>
  </form>
</div>
-->
<center><a class="ajouter-container" onclick="ajouter_container()"><span class="material-symbols-outlined circle">add_circle</span></a></center>


<script>
    function ajouter_container(){


        let container=document.getElementById("container");

        container.innerHTML += ' <div  class="trello"><div class="trello__list"> <span class="title_container">Title</span> <div class="trello__list__item"> <span class="title">Titre du task</span> <span>CSS is so good.</span> <span class="highlighted">CSS</span></div><div class="trello__list__item"><span class="title">Titre du task</span><span>GFG is great site to learn new things.</span> <span class="highlighted">GFG</span></div><div class="trello__list__item"><span class="title">Titre du task</span> <span>I like to write code in HTML,CSS.</span>  </div>  <center><button class="rounded-3 nv-task"  data-bs-toggle="modal" data-bs-target="#nv-task">Nouveau task</button></center>     </div> </div>'
    }

</script>
</body>
</html>