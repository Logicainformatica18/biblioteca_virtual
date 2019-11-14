<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sistema Educativo</title>

    <!-- CSS  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
    <!--  Scripts-->
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/init.js"></script>
</head>

<body>



        <!-- Load Facebook SDK for JavaScript -->
        <div id="fb-root"></div>
        <script>
        window.fbAsyncInit = function() {
            FB.init({
                xfbml: true,
                version: 'v4.0'
            });
        };

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = 'https://connect.facebook.net/es_LA/sdk/xfbml.customerchat.js';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        </script>

        <!-- Your customer chat code -->
        <div class="fb-customerchat" attribution=setup_tool page_id="538812943216349" theme_color="#6699cc"
            logged_in_greeting="Hola, en qué te puedo ayudar?" logged_out_greeting="Hola, en qué te puedo ayudar?">
        </div>
        <!--  ------------------------ -->
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous"
            src="https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v4.0">
        </script>

        <nav class="white"  role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="index.php" class="brand-logo">
                    <img src="imagenes/cesca.png" width="130px">
                </a>
                <ul class="right hide-on-med-and-down">

                    <li class="scroll"><a href="sylabus.php">Sylabus </a></li>
                    <li class="scroll"><a href="alumno_login.php">Alumno </a></li>
                    <li class="scroll"><a href="profesor_login.php">Profesor</a></li>
                </ul>

                <ul id="nav-mobile" class="sidenav">
                    <li class="scroll active"><a href="index.php">Inicio </a></li>
                    <li class="scroll"><a href="sylabus.php">Sylabus </a></li>
                    <li class="scroll"><a href="alumno_login.php">Alumno </a></li>
                    <li class="scroll"><a href="profesor_login.php">Profesor</a></li>
                </ul>
                <a href="#" data-target="nav-mobile" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            </div>
        </nav>

        <div id="index-banner" class="parallax-container">

            <div class="section no-pad-bot">
                <div class="container">

                    <br><br>
                    <h1 class="header center white-text text-darken-2"><b></b></h1>
                    <div class="row center">
                        <h5 class="header col s12 light"></h5>
                    </div>
                    <div class="row center">
                        <a href="https://www.facebook.com/Anthonyrc16" class="btn waves-effect red"
                            target="_blank"><b>Agrégame en <span
                                    class='black-text'>facebook.com/Anthonyrc16</span></b></a>
                        <a href="#" id="download-button" class="btn waves-effect green"><b>997852483</b></a>
                        <a href="#" id="download-button"
                            class="btn waves-effect blue"><b>Logicainformatica18@gmail.com</b></a>
                    </div>
                    <br><br>

                </div>
            </div>
            <div class="parallax"><img
                    src="https://scontent.flim18-3.fna.fbcdn.net/v/t1.0-9/48416838_2222282817782086_4471331447881334784_n.jpg?_nc_cat=101&_nc_oc=AQnihKnCHAWdpOrNkj3-yY1k6xABWj4rf3XrTFLzbQgIx5gIhderr0gKKo0ox8kjTqM&_nc_ht=scontent.flim18-3.fna&oh=81efdb5291a7deddb99094ad09e9bd48&oe=5E5385FE">
            </div>
        </div>
        <?php
        include "conexion.php";
        $action = isset($_GET['action']) ? $_GET['action'] : "";
        $semana = isset($_POST['semana']) ? $_POST['semana'] : "";
        $curso = isset($_GET['curso']) ? $_GET['curso'] : "";
        $selected = "";
        $j3 = 0;
        ?>


        <div class="container">
            <form action="index.php" method="get">
                <h5><b>ELIGE EL CURSO QUE QUIERES APRENDER HOY...</b></h5> <BR>

                <select class="browser-default" name="curso">
                    <?php
                    $select3 = "Select c.cod_curso,c.Descripcion,s.descripcion from curso c,sub_linea s,publicacion p where c.Cod_sublinea = s.Cod_sublinea  
     and p.cod_curso=c.cod_curso and s.cod_linea='001' and s.cod_marca ='01'
     group by c.Descripcion
      order by c.descripcion asc";
                    $query3 = (mysqli_query($conn, $select3));
                    $registro3 = mysqli_num_rows($query3);
                    while ($j3 < $registro3) {
                        $row3 = mysqli_fetch_array($query3);
                        $Cod3 = $row3[0];
                        $Descripcion3 = $row3[1] . " " . $row3[2];
                        if ($curso == $Cod3) {
                            $selected = "selected";
                        }

                        echo "<option value='$Cod3' $selected>$Descripcion3</option>";
                        $selected = "";
                        $j3++;
                    }
                    ?>
                </select>

                <p></p>
                <button class="btn waves-effect waves-light" type="submit" name="action" value="Buscar">Buscar
                    <i class="material-icons right">send</i>
                </button>
            </form>

            <?php
            if ($action == "Buscar") {
                $query_esp = (mysqli_query($conn, "call publicacion_search('$curso')"));
                $fila2 = mysqli_num_rows($query_esp);
                echo "<p></p>";
                $z2 = 0;

                while ($z2 < $fila2) {
                    $r2 = mysqli_fetch_array($query_esp);
                    echo "<h2 style='color: red'><b>" . $r2[6] . "</b></h2>";
                    echo "<table border='1'>";
                    echo "<thead>";
                    echo "<th>" . $r2[2] . " " . $r2[3] . " " . $r2[4] . " - " . $r2[5] . "</th><th> - Semana " . $r2[7] . " - Fecha - " . $r2[9] . "</th>";
                    echo "</thead>";
                    echo "<tbody>";
                    echo "<tr>";
                    echo "<td colspan='2'>" . $r2[8] . "</td>";
                    echo "</tr>";
                    echo "</tbody>";
                    echo "</table>";
                    echo "<p></p>";
                    //////////////////////////////////////////////////////////////////////////////////////////
                    $url_pdf = $r2['url_pdf'];
                    if ($url_pdf != "") {
                        echo "<p></p>";
                        // str_replace FUNCION QUE REEMPLAZA UNA CADENA DE TEXTO
                        $url_pdf = str_replace('/view', "/preview", $url_pdf);
                        echo "<iframe src='$url_pdf' width='100%' height='1000'></iframe>";
                    }
                    $z2++;
                }
            }



            ?>


            <div class="fb-comments" data-href="http://educativocesca.000webhostapp.com/index.php" data-width="100%"
                data-numposts="3" data-order-by="reverse_time"></div>
        </div>
    




    <?php
    include "pie.php";
    ?>