<?php

require_once('database.php');

// create a PDO instance and initialize $db
/// initialize $db because it represents a database connection, which is required to interact with the database using PHP.
///  Without initializing $db, you won't be able to perform any database operations like querying data, inserting data,
///  updating data, or deleting data.
try {
    $host = 'localhost';
    $dbname = 'guitar_shop';
    $username = 'root';
    $password = '';

    $db = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    // handle connection error
    echo 'Connection failed: ' . $e->getMessage();
    exit;
}

// Get products
$queryProducts = 'SELECT * FROM products';
$statement = $db->prepare($queryProducts);
$statement->execute();
$products = $statement->fetchAll();
$statement->closeCursor();

?>

<!DOCTYPE html>
<html>

        <head>
            <?php include 'includes/header.php'; ?>
        </head>

        <body>
        <header>
            <h1>Product Manager</h1>
            
        </header>

            <main class="container">

                <div class="starter-template text-center">
                    <h1>Bootstrap starter template</h1>
                    <p class="lead">Use this document as a way to quickly start any new project.<br> All you get is this text and a mostly barebones HTML document.</p>
                </div>


                <h1>Product List</h1>
                <section>
                <!-- display a table-->
                <table>
                    <tr>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Brand</th>
                        <th>Discount</th>
                        <th>Delete</th>
                    </tr>

                    <?php foreach ($products as $product) : ?> 
                    <tr>
                        <td><?php echo $product['productCode']; ?></td>
                        <td><?php echo $product['productName']; ?></td>
                        <td class="right"><?php echo $product['listPrice']; ?></td>
                        <td><?php echo $product['brand']; ?></td>
                        <td class="right"><?php echo $product['discount'] . '%'; ?></td>
                    
                        <td><form action="delete_product.php" method="post">
                            <input type="hidden" name="product_id"
                                value="<?php echo $product['productID']; ?>">
                            <input type="submit" value="Delete">
                        </form></td>
                    </tr>
                    <?php endforeach; ?>
                </table>
                    <!-- display a table-->
                </section>

            </main><!-- /.container -->

            <footer>
            <?php include 'includes/footer.php'; ?>
            </footer>

</html>