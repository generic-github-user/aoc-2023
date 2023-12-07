import Data.List
import Data.Ord
import Data.List.Split
import Data.IntervalSet

-- assume intervals include both endpoints
-- mappings must be sorted by start point
mapInterval :: [[Int]] -> (Int, Int) -> [(Int, Int)]

-- mergeIntervals :: [(Int, Int)] -> [(Int, Int)]
-- mergeIntervals ints =

-- parseBlock :: [String] -> (IntervalSet -> IntervalSet)
parseBlock :: [String] -> ([(Int, Int)] -> [(Int, Int)])
parseBlock b =
    let slices = map (map read . splitOn " ") (tail b) :: [[Integer]]
    in map (mapInterval slices) b

main = do
    content <- readFile "./input-5-short.txt"
    let l = lines content
    print
        $ (foldl1 (flip (.)) $ map parseBlock $ splitOn [""] $ (drop 2 l))
        $ map (\[x, y] -> (x, y))
        $ chunksOf 2 (map read $ splitOn " " $ drop 7 $ head l)

