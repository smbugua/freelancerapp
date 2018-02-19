<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>FreeLance Plus| Login</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script src="js/modernizr.custom.63321.js"></script>
        <!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>
			body {
				background: #e1c192 url(images/wood_pattern.jpg);
			}
		</style>
    </head>
    <body>
        <div class="container">
		
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="http://tympanus.net/Tutorials/RealtimeGeolocationNode/">
                </a>
                <span class="right">
                    <a href="http://tympanus.net/codrops/?p=11372">
                    </a>
                </span>
            </div><!--/ Codrops top bar -->
			
			<header>
			
				<h1>Freelance Plus <strong>Register </strong> Module</h1>
				<h2>Where Creative Minds Mingle</h2>
		

				<div class="support-note">
					<span class="note-ie">Sorry, only modern browsers.</span>
				</div>
				
			</header>
			
			<section class="main">
				<form class="form-2" action="userclass.php?action=register" method="post">
					<h1><span class="log-in">Sign Up</span> Form <span class="sign-up"></span></h1>
					<p class="float">
						<label for="login"><i class="icon-user"></i>Username</label>
						<input type="text" name="username" placeholder="Username" required="">
					</p>
						<p class="float">
						<label for="login"><i class="icon-user"></i>Email</label>
						<input type="text" name="email" placeholder="Email" required="">
					</p>
						<p class="float">
						<label for="login"><i class="icon-user"></i>Full Names</label>
						<input type="text" name="name" placeholder="Full Names" required="">
					</p>
						<p class="float">
						<label for="login"><i class="icon-user"></i>Tel</label>
						<input type="text" name="tel" placeholder="Phone Number" required="">
					</p>	
						<p class="float">
						<label for="login"><i class="icon-lock"></i>Account Type</label>
						<select class="form-control" name="role">
							<?php
							include('../auth.php');
							$r=mysql_query("SELECT id,role FROM roletypes where role !='Admin'");
							while($rr=mysql_fetch_array($r)){
							?>
							<option value="<?php echo $rr[0]?>"> <?php echo $rr[1]?> </option>
							<?php }?>
						</select>
					</p>
					<p class="float">
						<label for="password"><i class="icon-lock"></i>Password</label>						
						<input type="password" name="password" placeholder="Password"  required="">
					</p>
					<p class="float">
						<input type="password" name="password2" placeholder="Confirm Password" class="showpassword">
					</p>
					<p class="clearfix">  

						<input type="submit" name="submit" value="Sign Up">
					</form>  
					</p>
				</form>​​
			</section>
			
        </div>
		<!-- jQuery if needed -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<script type="text/javascript">
			$(function(){
			    $(".showpassword").each(function(index,input) {
			        var $input = $(input);
			        $("<p class='opt'/>").append(
			            $("<input type='checkbox' class='showpasswordcheckbox' id='showPassword' />").click(function() {
			                var change = $(this).is(":checked") ? "text" : "password";
			                var rep = $("<input placeholder='Password' type='" + change + "' />")
			                    .attr("id", $input.attr("id"))
			                    .attr("name", $input.attr("name"))
			                    .attr('class', $input.attr('class'))
			                    .val($input.val())
			                    .insertBefore($input);
			                $input.remove();
			                $input = rep;
			             })
			        ).append($("<label for='showPassword'/>").text("Show password")).insertAfter($input.parent());
			    });

			    $('#showPassword').click(function(){
					if($("#showPassword").is(":checked")) {
						$('.icon-lock').addClass('icon-unlock');
						$('.icon-unlock').removeClass('icon-lock');    
					} else {
						$('.icon-unlock').addClass('icon-lock');
						$('.icon-lock').removeClass('icon-unlock');
					}
			    });
			});
		</script>
    </body>
</html>