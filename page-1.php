<?php

require_once('database.php');


// Get branches
$queryBranches = 'SELECT * FROM branch';
$statement = $db->prepare($queryBranches);
$statement->execute();
$branches = $statement->fetchAll();
$statement->closeCursor();

?>

<?php include 'includes/header.php'; ?>

<body>

<div class="containerAll" >

<!--    -->

<div class="containerTable" style="width:1000px; margin:0 auto; " >

    <header>
        <h1>Branch Manager</h1>
    </header>

    <div class="starter-template text-center">
        <h1>Bootstrap starter template</h1>
        <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
    </div>

    <h1>Branch List</h1>


    <div class="tabla-desktop" style="align-content: center">
<!--          <section>-->
              <!-- display a table-->
              <table>
                  <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Manager</th>
                      <th>Telephone</th>
                      <th>Address</th>
                      <th>Established</th>
<!--                      <th>Delete</th>-->
                  </tr>

                  <?php foreach ($branches as $branch) : ?>
                      <tr>
                          <td><?php echo $branch['Branch_Id']; ?></td>
                          <td><?php echo $branch['Branch_Name']; ?></td>
                          <td><?php echo $branch['Manager_Name']; ?></td>
                          <td><?php echo $branch['Telephone']; ?></td>
                          <td><?php echo $branch['Address_Line1'] . ', ' . $branch['Address_Line2'] . ', ' . $branch['Address_Line3'] . ', ' . $branch['Eircode']; ?></td>
                          <td><?php echo $branch['Established']; ?></td>
<!--                          <td>-->
<!--                              <form action="delete_branch.php" method="post">-->
<!--                                  <input type="hidden" name="branch_id"-->
<!--                                         value="--><?php //echo $branch['Branch_Id']; ?><!--">-->
<!--                                  <input type="submit" value="Delete">-->
<!--                              </form>-->
<!--                          </td>-->

                      </tr>
                  <?php endforeach; ?>
              </table>
              <!-- display a table-->
<!--          </section>-->

    </div>

</div><!-- /.container table -->


</div>

<?php include 'includes/footer.php'; ?>

</body>
