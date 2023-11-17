<?php
require("./config/pdo.php");
$users = [
        ['JohnDoe', 'hashed_password_1', 'john.doe@email.com', '1234567890', '1990-01-15', 'New York'],
        ['JaneSmith', 'hashed_password_2', 'jane.smith@email.com', '9876543210', '1985-05-20', 'Los Angeles'],
        ['AliceJones', 'hashed_password_3', 'alice.jones@email.com', '5551234567', '1992-09-08', 'Chicago'],
        ['BobMiller', 'hashed_password_4', 'bob.miller@email.com', '9998887777', '1988-03-25', 'Houston'],
        ['EvaWilliams', 'hashed_password_5', 'eva.williams@email.com', '4445556666', '1995-11-12', 'Miami'],
        ['CharlieBrown', 'hashed_password_6', 'charlie.brown@email.com', '1239874560', '1982-07-30', 'San Francisco'],
        ['GraceTaylor', 'hashed_password_7', 'grace.taylor@email.com', '7896541230', '1993-04-18', 'Seattle'],
        ['DavidClark', 'hashed_password_8', 'david.clark@email.com', '3216549870', '1987-12-05', 'Denver'],
        ['SophieBaker', 'hashed_password_9', 'sophie.baker@email.com', '4567890123', '1998-02-22', 'Boston'],
        ['RyanCarter', 'hashed_password_10', 'ryan.carter@email.com', '9870123456', '1984-06-10', 'Atlanta'],
        ['OliviaHill', 'hashed_password_11', 'olivia.hill@email.com', '6547890123', '1991-08-28', 'Phoenix'],
        ['WilliamWard', 'hashed_password_12', 'william.ward@email.com', '2345678901', '1989-10-15', 'Dallas'],
        ['EmmaFisher', 'hashed_password_13', 'emma.fisher@email.com', '8765432109', '1997-01-03', 'Detroit'],
        ['MichaelWright', 'hashed_password_14', 'michael.wright@email.com', '1357924680', '1986-09-20', 'Philadelphia'],
        ['AvaMartin', 'hashed_password_15', 'ava.martin@email.com', '6789012345', '1994-07-07', 'Minneapolis'],
];

foreach ($users as $user) {
        $username = $user[0];
        $passwordHash = $user[1];
        $email = $user[2];
        $phoneNumber = $user[3];
        $dob = $user[4];
        $city = $user[5];
        $sql = "INSERT INTO users (username, passwordHash, email, phoneNumber, dob, city) 
    VALUES ('$username', '$passwordHash', '$email', '$phoneNumber', '$dob', '$city')";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
}
