<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <style>
/* width */
::-webkit-scrollbar {
  width: 6px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #395237; 
}
 </style>
    <div class="row" style="margin-right:15px;">
    <div class="col-sm-2">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color: #293a4a; color: white;">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="color: white;" href="system_dashboard.php">
                <h4><img src="img/logo.png" alt="LOGO" width="40px" height="40px"> Samurdhi bank</h4>
            </a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
                        
            <li >
                <a href="logout.php" style="text-decoration:none; color:white;"><?php echo $_SESSION['login_user']; ?> | <b class="far fa-share-square"></b> </a>
               
            </li>
        </ul>

        <?php if ($_SESSION['login_type']=='manager'){ ?>
        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <h5 style="margin-left: 5px; margin-top: 10px;">Main</h5>
                <hr style="border: 0; border-top: 1px solid #4f5861; margin-bottom: -5px; margin-top: -5px;">
                <li>
                    <a href="system_dashboard.php"><i class="fa fa-bar-chart"></i> Dashboard</a>
                </li>
                <h5 style="margin-left: 5px; margin-top: 10px;">Operations</h5>
                <hr style="border: 0; border-top: 1px solid #4f5861; margin-bottom: -5px; margin-top: 10px;">

                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-fw fa-user"></i> Employee <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-1" class="collapse">
                        <li><a href="add_employee.php"><i class="fa fa-angle-double-right"></i> New emplyee</a></li>
                        <li><a href="employee.php"><i class="fa fa-angle-double-right"></i> Manage employee</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-2"><i class="fa fa-columns"></i> Branch <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-2" class="collapse">
                        <li><a href="add_branch.php"><i class="fa fa-angle-double-right"></i> New branch</a></li>
                        <li><a href="branch.php"><i class="fa fa-angle-double-right"></i> Manage branch</a></li>
                    </ul>
                </li>
                
                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-3"><i class="fas fa-diagnoses"></i> Customer <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-3" class="collapse">
                        <li><a href="customer.php"><i class="fa fa-angle-double-right"></i> Manage customer</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-4"><i class="fab fa-paypal"></i> Transactions <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-4" class="collapse">
                        <li><a href="transaction.php"><i class="fa fa-angle-double-right"></i> Transaction list</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-5"><i class="fab fa-paypal"></i> Loan <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-5" class="collapse">
                        <li><a href="loan_status.php"><i class="fa fa-angle-double-right"></i> Pending list</a></li>
                        <li><a href="loan_details.php"><i class="fa fa-angle-double-right"></i> Loan approval details</a></li>
                        <li><a href="list_of_loans.php"><i class="fa fa-angle-double-right"></i> List of loans</a></li>
                    </ul>
                </li>

                

                <li>
                    <a href="backup.php"><i class="fa fa-dedent"></i> Database backup</a>
                </li>
                <li>
                    <a href="login_tracking.php"><i class="fa fa-line-chart"></i> Login tracking</a>
                </li>

                <h5 style="margin-left: 5px; margin-top: 10spx;"> Other</h5>
                <hr style="border: 0; border-top: 1px solid #4f5861; margin-bottom: -5px; margin-top: 10px;">
                <li>
                    <a href="logout.php"><i class="far fa-share-square"></i> logout</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</div>
<?php }elseif($_SESSION['login_type']=='employee') {?>
        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <h5 style="margin-left: 5px; margin-top: 10px;">Main</h5>
                <hr style="border: 0; border-top: 1px solid #4f5861; margin-bottom: -5px; margin-top: -5px;">
                <li>
                    <a href="system_dashboard.php"><i class="fa fa-bar-chart"></i> Dashboard</a>
                </li>
                <h5 style="margin-left: 5px; margin-top: 10px;">Operations</h5>
                <hr style="border: 0; border-top: 1px solid #4f5861; margin-bottom: -5px; margin-top: 10px;">


                
                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-3"><i class="fas fa-diagnoses"></i> Customer <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-3" class="collapse">
                        <li><a href="add_customer.php"><i class="fa fa-angle-double-right"></i> New customer</a></li>
                        <li><a href="customer.php"><i class="fa fa-angle-double-right"></i> Manage customer</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-4"><i class="fab fa-paypal"></i> Transactions <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-4" class="collapse">
                        <li><a href="add_transaction.php"><i class="fa fa-angle-double-right"></i> New transaction</a></li>
                        <li><a href="transaction.php"><i class="fa fa-angle-double-right"></i> Transaction list</a></li>
                    </ul>
                </li>

                <li>
                    <a href="#" data-toggle="collapse" data-target="#submenu-5"><i class="fab fa-paypal"></i> Loan <i class="fa fa-fw fa-angle-down pull-right"></i></a>
                    <ul id="submenu-5" class="collapse">
                        <li><a href="loan_request.php"><i class="fa fa-angle-double-right"></i> New Loan request</a></li>
                        <li><a href="loan_details.php"><i class="fa fa-angle-double-right"></i> Loan approval details</a></li>
                        <li><a href="list_of_loans.php"><i class="fa fa-angle-double-right"></i> List of loans</a></li>
                    </ul>
                </li>

                

                <h5 style="margin-left: 5px; margin-top: 10spx;"> Other</h5>
                <hr style="border: 0; border-top: 1px solid #4f5861; margin-bottom: -5px; margin-top: 10px;">
                <li>
                    <a href="logout.php"><i class="far fa-share-square"></i> logout</a>
                </li>

            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</div>


    <?php } ?>

<script type="text/javascript">
    
    $(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $(".side-nav .collapse").on("hide.bs.collapse", function() {                   
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-right").addClass("fa-angle-down");
    });
    $('.side-nav .collapse').on("show.bs.collapse", function() {                        
        $(this).prev().find(".fa").eq(1).removeClass("fa-angle-down").addClass("fa-angle-right");        
    });
})       
</script>