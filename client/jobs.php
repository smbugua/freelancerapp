<?php
include('header.php');
$personid=$_SESSION['personid'];
$query="SELECT j.title as title ,j.description as description,j.budget as budget,p.name as cname ,  from jobs where requester_id='$personid' order by  id asc";
$result=mysql_query($query);
?>
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.php" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Job Posts Details</a> </div>
    <h1>Job Posts Details</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">

<div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Job Posts Details</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Title</th>
                  <th>Description</th>
                  <th>Budget</th>
                  <th>Assignee</th>
                  <th>Date Posted</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
              <?php 
              $no=0;
              while($row=mysql_fetch_array($result)){?>
                <tr class="gradeX">
                <?php
                $no++;
                ?>
                  <td><?php echo $no?></td>
                  <td><?php echo $row['title']?></td>
                  <td><?php echo $row['description']?></td>
                  <td><?php echo $row['budget']?></td>
                  <td><?php echo $row['cname']?></td>
                  <td><?php echo $row['assignedto']?></td>
                  <td><?php echo $row['status']?></td>
                </tr>
                <?php }?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

<?php// include('footer.php');?>
</div>
<!--Footer-part-->
<!--end-Footer-part-->

</body>
</html>

<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/matrix.tables.js"></script>