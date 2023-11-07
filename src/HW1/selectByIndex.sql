EXPLAIN SELECT *
        FROM client
        WHERE PassportID IN (
            SELECT Id
            FROM passport
            WHERE Number = '777777' AND Series = '6543'
        );

EXPLAIN SELECT * FROM address ORDER BY Street, BuildingNumber;




