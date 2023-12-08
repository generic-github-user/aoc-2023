import Data.Sort
import Data.List
import Data.Maybe
import Data.Ord

score :: String -> (Int, Int, [Int])
score h = let cards = "AKQT98765432J"; h2 = filter (/='J') h in
    -- TODO: clean up...
    ((length $ nub h) - (if (elem 'J' h && h2 /= []) then 1 else 0),
    negate $ ((if h2 == [] then 0 else maximum $ map length $ group $ sort h2)
        + (length $ filter (=='J') h)), -- more concise options?
    map (\c -> fromJust $ elemIndex c cards) h)

main = do
    content <- readFile "./input-7.txt"
    let hands = [(a, read b :: Int) | [a, b] <- (map words $ lines content)]
    print $ sum $ zipWith (*) [1..] (map snd $ sortOn (Down . score . fst) hands)
