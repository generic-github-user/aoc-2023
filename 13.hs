import Data.Sort
import Data.List
import Data.Maybe
import Data.Ord

score :: String -> (Int, Int, [Int])
score h = let cards = "AKQJT98765432" in
    -- is there a more idiomatic way to do this?
    -- (https://stackoverflow.com/questions/4272791/how-to-find-the-index-of-an-element-in-a-list#comment4633099_4272791)
    (length $ nub h,
    negate $ maximum $ map length $ group $ sort h,
    map (\c -> fromJust $ elemIndex c cards) h)

main = do
    content <- readFile "./input-7.txt"
    let hands = [(a, read b :: Int) | [a, b] <- (map words $ lines content)]
    print $ sum $ zipWith (*) [1..] (map snd $ sortOn (Down . score . fst) hands)
    -- putStrLn $ intercalate "\n" $ map show (sortOn (Down $ score . fst) hands)
