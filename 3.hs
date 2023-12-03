import Data.List.Split
import qualified Data.Map.Strict as M

parseColor :: String -> (String, Integer)
parseColor c = (x !! 1, read $ x !! 0)
    where x = splitOn " " c

filterGames :: [String] -> String -> Integer
filterGames games bag =
    sum $ map (read . head . (splitOn ":") . (drop 5))
        (filter (\g -> all (\r -> all
            (\c -> let c2 = parseColor c in
                (snd c2) <= (b M.! (fst c2))) (splitOn ", " r))
            (splitOn "; " $ last $ splitOn ": " g)) games)
        where b = M.fromList (map parseColor (splitOn ", " bag))

main = do
    content <- readFile "./input-2.txt"
    print (filterGames (lines content) "12 red, 13 green, 14 blue")
