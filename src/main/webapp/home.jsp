<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Pro
  Date: 13/04/2023
  Time: 23:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="beans.Uticonnexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<String[]> all_tasks = (ArrayList<String[]>) request.getAttribute("all_tasks");
    HashMap container_task= (HashMap) request.getAttribute("container_task");
    boolean afficherElement = Boolean.parseBoolean(request.getParameter("afficherelement"));
    String alert_txt = request.getParameter("alert_txt");
%>
<html>
<head>
    <title>Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.14/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.14/dist/sweetalert2.all.min.js"></script>




    <!-- Bootstrap Font Icon CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <style>


        .navbar {
            position: absolute;
            margin-top: -40px;

            right: 0;
            left: 0;
            color: #ffffff;
            height: 60px;
            backdrop-filter: blur(2px);
            background-color: rgba(255, 255, 255, .15);
            margin-top: -15px;
        }

        .navbar .container_flex {
            flex-direction: column;
        }

        .navbar a {
            text-decoration: none;
        }

        .navbar .logo-image {
            width: 134px;
            height: 30px;
            margin-top: 0.5rem;
            margin-bottom: 1.25rem;
        }

        .navbar .logo-text {
            margin-bottom: 0.5rem;
            color: #ffffff;
            font-weight: 500;
            font-size: 2rem;
            line-height: 1.875rem;
        }

        .navbar ul {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 0.5rem 0.75rem 0 0.75rem;
            background-color: rgba(0, 0, 0, 0.2);
            margin-top: 15px;
        }

        .navbar ul li {
            padding: 0 0.75rem 0.5rem 0.75rem;
        }

        .navbar ul a {
            color: #ffffff;
        }

        .navbar ul a:hover {
            border-bottom: 2px #ffffff solid;
        }


        .navbar .container_flex {
            flex-direction: row;
            justify-content: space-between;
        }

        .navbar .logo-image {
            margin-top: 50px !important;
            margin: 0;
        }

        .navbar .logo-text {
            margin-bottom: 0;
        }

        .navbar ul {
            padding: 0;
            background: none;
        }

        .navbar ul li {
            margin-top: 50px !important;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .navbar ul li:last-of-type a {
            margin-right: 0;
            padding-right: 0;
        }



        .container {
            margin: 0 auto;
            padding: 0 15px;
        }
        .container_flex {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }
        .container{
            max-width: 1140px;
        }


        body{
            background-image:url("../images/image.jpg");
            font-size:large ;
            background-size: cover;

        }


        .mask-custom {
            backdrop-filter: blur(5px);
            background-color: rgba(255, 255, 255, .15);
        }


        .todo{

            display: grid;
            grid-template-rows: 1fr;
            grid-template-columns: repeat(auto-fit,250px);
            grid-gap: 20px;
            padding: 5px;
        }
        .todo__list{

            flex: 0 0 27rem;
            display: flex;
            flex-direction: column;
            backdrop-filter: blur(2px);
            background-color: #e2e4e6;
            max-height: calc(100vh - 11.8rem);
            border-radius: 0.3rem;
            margin-right: 1rem;
            padding: 5px;
        }
        .trello__list:last-of-type {
            margin-right: 0;
        }
        .todo_list_item{
            flex: 1;
            display: flex;
            flex-direction: column;
            align-content: start;
            padding: 0 0.6rem 0.5rem;
            overflow-y: auto;
            background: white;
            border-radius: 10px;
            margin: 7px;
        }
        .todo_list_item::-webkit-scrollbar {
            width: 1.6rem;
        }

        .todo_list_item::-webkit-scrollbar-thumb {
            background-color: #c4c9cc;
            border-right: 0.6rem solid #e2e4e6;
        }

        .highligh{
            width: 80px;
            color: white;
            border-radius: 4px;
            padding: 2px;
            font-size: small;
            margin-top: 2px;
        }
        .highlighted{

            width: 80px;
            color:#044184 ;
            border-radius: 4px;
            padding: 2px;
            font-size: small;
            margin-top: 2px;
        }
        .title{
            color: #DAAB54;
            padding: 2px;
            font-size: large;
            font-weight: bold;
            margin-top: 2px;
        }
        .nv-task{
            background-color:#A7CAD1;
            color:#044184 ;
            border: #A7CAD1;
            font-size:large;

        }
        .nv-boutton-trash{
            background-color:#ffffff;
            color:#044184 ;
            border:#ffffff;
        }
        .nv-boutton-pen{
            background-color: #e2e4e6;
            color:#044184 ;
            border:#c5edf6;;
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
            background-color: #ffffff;
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
        ul{
            list-style-type: none;
        }
        /* Style The Dropdown Button */
        /* IE11 hide native button (thanks Matt!) */
        select::-ms-expand {
            display: none;
        }

        .selectdiv:after {
            content: '<>';
            font: 17px "Consolas", monospace;
            color: #333;
            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
            -ms-transform: rotate(90deg);
            transform: rotate(90deg);
            right: 11px;
        /Adjust for position however you want/

        top: 18px;
            padding: 0 0 2px;
            border-bottom: 1px solid #999;
            /*left line */

            position: absolute;
            pointer-events: none;
        }

        .selectdiv select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            /* Add some styling */

            display: block;
            width: 100%;
            max-width:80px;
            height: 30px;
            float: right;
            padding: 2px;
            font-size: 16px;
            line-height: 1.75;
            color: #333;
            border-radius: 5px;
            background-color: #ffffff;
            background-image: none;
            -ms-word-break: normal;
            word-break: normal;
        }

        .form-control:focus{
            box-shadow: none;
            border: none;
        }
        .form-control::placeholder{
            color: #898f8f;
            font-size: 20px;
            font-weight: 400;
        }
    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark shadow-5-strong">
    <a style="margin-left: 100px"  class="navbar-brand" href="index.jsp"><span style="color: #5e9693;">MY</span><span style="color: #fff;">TODO</span></a>
        <span style="margin-left: 1000px" class="navbar-text">
            <a href="/LogOutServlet">
       déconnexion
                </a>
    </span>
    </div>
</nav>

<div>
    <br>
    <br>

    <br>
    <div class="row">
    <%
        for(Object key :container_task.keySet()){

    %>
    <div class="col-2">
    <div  id="container" class="todo">
        <div class="todo__list" >
            <div>
                <span  class="title_container" ><%=key%>      <button  type="button" class="rounded-3 nv-boutton-pen"  data-bs-toggle="modal" data-bs-target="#editercontainer<%=key%>" name="editer_task"><i style="width: 10px; background: none!important;" class="bi bi-pen"></i>
                    <form method="post" action="DeleteContainerServlet"><button style=" margin-right: 5px!important; background:  #e2e4e6; border-color:  #e2e4e6; border:  #e2e4e6" class="rounded-3 trash_container" value="<%=key%>" name="delete_container"><i style="width: 10px; margin-left: 30px" class="bi bi-trash"></i></button></form>
</button> </span>
            </div>
            <%ArrayList<String[]> values = (ArrayList<String[]>) container_task.get(key);
                for (String[] value_info : values) { %>
            <div class="type-task">
                <div>
                    <%=value_info[2]%>
                    <button style="width: 40px; margin-left: 10px" class="rounded-3 nv-boutton-trash" onclick="deleteTask(<%=value_info[3]%>)" value="<%=value_info[3]%>"><i style="width: 10px; margin-left: 30px" class="bi bi-trash"></i></button>
                </div>
                <div class="todo_list_item">
                    <span class="title" id="title<%=value_info[3]%>" onclick="updateTitle(<%=value_info[3]%>)" contenteditable="true"><%=value_info[1]%></span>
                    <span style="font-size:large; font-weight: normal" id="description<%=value_info[3]%>" onclick="updatedescription(<%=value_info[3]%>)" contenteditable="true"><%=value_info[0]%></span>

                    <span class="highlighted"><%=value_info[4]%></span>
                </div>
            </div>


            <%}%>
            <center><button  type="button" class="rounded-3 nv-task"  data-bs-toggle="modal" data-bs-target="#ajout<%=key%>" name="ajouter_task" >Nouvelle tâche</button></center>
        </div>
    </div>
    </div>
    <%
        }
    %>
    </div>



    <div id="error">

    </div>

</div>

<div id="html-contenue"></div>
<script>
    function deleteTask(task_id){
        $(document).ready(function() {
            console.log("kskslslsl : " + task_id);
            var postData = {
                task_id: task_id,
            };
            $.post('/DeleteTaskServlet', postData, function(data) {
                if (data == "error"){
                    console.log("High");
                    /* document.getElementById("error").innerHTML = alert('<div class="alert aler-danger">' +
                         ' Attention ! c est une tache eleve</div>' +
                         '<form method="post" action="/DeletHighTaskServlet"><button name="task_id" value="' + task_id + '">Supprimer quand meme</button></form>');*/
                    Swal.fire({
                        title: 'Attention! Taches avec priorité élevée',
                        text: 'Êtes-vous sûr de vouloir supprimer cette tache? ',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonText: 'Supprimer',
                        cancelButtonText: 'Annuler'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // Effectuez la redirection vers la servlet avec la valeur
                            window.location.href = "/DeletHighTaskServlet?task_id="+task_id;
                        }
                    })
                }
                else{
                    console.log("Not High");
                    window.location.href = "/HomeServlet";
                }
            }, 'text');

        });
    }
    function updateTitle(task_id){
        console.log("test")
        $(document).ready(function() {
            console.log("test")
            console.log(task_id)
            var title = $("#title"+task_id);
            title.on('blur', function() {
                console.log('fff')
                var newTitle = title.html();
                console.log(newTitle)
                $.ajax({
                    type: 'POST',
                    url: '/EditerTitleServlet',
                    data: { title: newTitle,
                        task_id:task_id},
                    success: function(response) {
                        console.log("test")
                        // La requête a réussi, faites quelque chose ici si nécessaire
                    },
                    error: function(xhr, status, error) {
                        // La requête a échoué, traitez l'erreur ici si nécessaire
                    }
                });
            });
        });
    }

    function updatedescription(task_id){
        console.log("test")
        $(document).ready(function() {
            console.log("test")
            console.log(task_id)
            var description = $("#description"+task_id);
            description.on('blur', function() {
                console.log('fff')
                var newDescription = description.html();
                console.log(newDescription)
                $.ajax({
                    type: 'POST',
                    url: '/EditerDescriptionServlet',
                    data: { description: newDescription,
                        task_id:task_id},
                    success: function(response) {

                        console.log("test")
                        // La requête a réussi, faites quelque chose ici si nécessaire
                    },
                    error: function(xhr, status, error) {
                        // La requête a échoué, traitez l'erreur ici si nécessaire
                    }
                });
            });
        });
    }


</script>
<div id="model" >
    <%
        for(Object key :container_task.keySet()){ %>
    <%ArrayList<String[]> values = (ArrayList<String[]>) container_task.get(key);
        for (String[] value_info : values) { %>
    <div class="modal fade " style="  backdrop-filter: blur(1px);" id="supp<%=value_info[3]%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document" >
            <div class="modal-content"style="background:#A7CAD1; border-radius: 10px; height: 400px; width: 600px" >
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">supprimer</h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

            </div>
        </div>
    </div>
    <%}
    }
    %>
</div>
<% for(Object key :container_task.keySet()){ %>
<%ArrayList<String[]> values = (ArrayList<String[]>) container_task.get(key);%>
<div class="modal fade " id="editercontainer<%=key%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document"  >
        <div class="modal-content"style="background:#A7CAD1; border-radius: 10px; width:250px!important; backdrop-filter: blur(1px);" >
            <div class="modal-header">
                <h5 class="modal-title" >Editer titre</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/EditerContainerTitleServlet" method="post">
                    <input type="text" hidden value="<%=key%>" name="old_title">
                    <input  class="form-control user" type="text" name="new_title_container" value="<%=key%>" placeholder="Editer le titre du recipient" ><br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" name="editer_container_title" value="<%=key%>" >Editer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%}
%>


<% for(Object key :container_task.keySet()){ %>
<div class="modal fade " style=" backdrop-filter: blur(1px);" id="ajout<%=key%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" >
        <div class="modal-content"style="background:#A7CAD1; border-radius: 10px; height: 415px; width: 650px !important;" >
            <div class="modal-header">
                <h5 class="modal-title" id="label1">Ajouter une nouvelle tache</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/HomeServlet" method="post">
                    <input type="hidden" name="action" value="ajout">
                    <input  class="form-control user" type="text" id="title-task" name="title_task" placeholder="Ajouter le titre du task" ><br>
                    <input class="form-control user" type="text" id="desc-task" name="desc_task" placeholder="Ajouter la description du task"  ><br>
                    <label>Ajouter la préorité du task</label><br>
                    <center><input type="radio" id="important" name="priority" value="HIGH">
                        <label for="Important">Important</label><br>
                        <input type="radio" id="moyen" name="priority" value="MEDIUM">
                        <label for="moyen">Moyen</label><br>
                        <input type="radio" id="pas_important" name="priority" value="LOW">
                        <label for="pas_important">Faible</label><br></center>
                    <label for="dueDate">Date d'échéance:</label>
                    <input type="date" id="dueDate" name="dueDate">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" name="ajouter" value="<%=key%>"  onclick="ajouterfunction()">Ajouter</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%}%>

</div>
<center><a type="button" > </a></center>
<center><button  type="button" class="rounded-3 nv-task"  style="margin-top: 50px" data-bs-toggle="modal" data-bs-target="#ajoutContainer" >Nouveau groupe</button></center>
<div style="" class="modal fade " style="  backdrop-filter: blur(1px); height: 230px!important;" id="ajoutContainer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" >
        <div class="modal-content"style="background:#A7CAD1; border-radius: 10px; height: 230px; width: 600px" >
            <div class="modal-header">
                <h5 class="modal-title" id="label1">Ajouter un groupe</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="AjouterContainerServlet" method="post">
                    <input  class="form-control user" type="text" id="title-container" name="title_container" placeholder="Ajouter le titre du groupe" ><br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal" name="ajouter_container">Ajouter groupe</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    function ajouter_container(){


        let container=document.getElementById("container");
        // ajax => add container to db


        container.innerHTML += ' <div  class="todo"><div class="todo__list"><button class="rounded-3 nv-task"  data-bs-toggle="modal" data-bs-target="#nv-task">Nouvelle tâche</button></center>     </div> </div>'
    }
</script>
</body>
</html>