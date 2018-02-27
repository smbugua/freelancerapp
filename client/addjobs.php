<?php
include('header.php');
$personid=$_SESSION['personid'];
$platforms=mysql_query("SELECT id,name FROM platforms order by id asc");
?>
<div id="content-header">
  <div id="breadcrumb"> <a href="index.php" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="myjobs.php" class="tip-bottom">Jobs</a> <a href="addjobs.php" class="current">Add Job</a> </div>
  <h1>Add New Job Request</h1>
</div>
<div class="container-fluid">
  <hr>
  <div class="row-fluid">
    <div class="span6">
      <div class="widget-box">
        <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
          <h5>Job Info</h5>
        </div>
        <div class="widget-content nopadding">
          <form action="clientclass.php?action=addjob&&personid=<?php echo $personid ?>" method="post" class="form-horizontal">
            <div class="control-group">
              <label class="control-label">Title</label>
              <div class="controls">
                <input type="text" class="span11" placeholder="Job Title" name="title" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Budget KES: </label>
              <div class="controls">
                <input type="text" class="span11" name="budget" placeholder="Budget" />
              </div>
            </div>
             <div class="control-group">
              <label class="control-label">Preffered Platform/ (s)</label>
              <div class="controls">
                <select multiple name="platforms[]" >
                	<?php while($platformrows=mysql_fetch_array($platforms)){?>
                  <option value="<?php echo $platformrows['id']?>"> <?php echo $platformrows['name']?> </option>
                  <?php }?>
                </select>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Description</label>
              <div class="controls">
               
                <textarea class="span11" rows="7"  name="desc"></textarea>
              </div>
            </div>
            <div class="form-actions">
              <button type="submit" class="btn btn-success">Save</button>
            </div>
          </form>
        </div>
      </div>