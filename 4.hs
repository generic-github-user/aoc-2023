import Data.List.Split
import qualified Data.Map.Strict as M

parseColor :: String -> (String, Integer)
parseColor c = (x !! 1, read $ x !! 0)
    where x = splitOn " " c

fewest :: [String] -> [M.Map String Integer]
fewest games =
    map ((foldl1 $ M.unionWith max) . \g ->
        map (M.fromList . map parseColor . splitOn ", ")
        (splitOn "; " $ last $ splitOn ": " g)) games

main = do
    content <- readFile "./input-2.txt"
    print (sum (map (product . M.elems) (fewest $ lines content)))
