<?php if (!empty($_users_)) { ?>

    <table>
        <tr>
            <th>Code</th>
            <th>Nom</th>
            <th>Email</th>
        </tr>

        <?php foreach ($_users_ as $user) { ?>

        <tr>
            <td><?php echo htmlentities($user['id']); ?></td>
            <td><?php echo htmlentities($user['name']); ?></td>
            <td><?php echo htmlentities($user['email']); ?></td>
        </tr>
        <?php } ?>
    </table>
<?php } else { ?>

<p>Aucun utilisateur</p>

<?php } ?>