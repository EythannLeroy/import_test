<?php
    if (isset($lescommercants['nom'])) {
        $lescommercants = [$lescommercants];
    }

    foreach ($lescommercants as $commercant) {
        echo $commercant['prenom'] . ' ' . $commercant['nom'] . '<br>';
    }
?>