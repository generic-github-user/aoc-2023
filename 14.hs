import Data.Sort
import Data.List
import Data.Maybe
import Data.Ord

score :: String -> (Int, Int, [Int])
score h = let cards = "AKQT98765432J"; h2 = filter (/='J') h in
    -- is there a more idiomatic way to do this?
    -- (https://stackoverflow.com/questions/4272791/how-to-find-the-index-of-an-element-in-a-list#comment4633099_4272791)
    -- TODO: clean up...
    ((length $ nub h) - (if (elem 'J' h && h2 /= []) then 1 else 0),
    negate $ ((if h2 == [] then 0 else maximum $ map length $ group $ sort h2)
        + (length $ filter (=='J') h)), -- more concise options?
    map (\c -> fromJust $ elemIndex c cards) h)

main = do
    content <- readFile "./input-7.txt"
    let hands = [(a, read b :: Int) | [a, b] <- (map words $ lines content)]
    print $ sum $ zipWith (*) [1..] (map snd $ sortOn (Down . score . fst) hands)
    -- putStrLn $ intercalate "\n" $ map (show . \x -> (fst x, score $ fst x)) (sortOn (Down . score . fst) hands)
