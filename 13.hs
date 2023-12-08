import Data.Sort
import Data.List
import Data.Maybe
import Data.Ord

score :: String -> (Int, Int, [Int])
score h = let cards = "AKQJT98765432" in
    -- is there a more idiomatic way to do this?
    -- (https://stackoverflow.com/questions/4272791/how-to-find-the-index-of-an-element-in-a-list#comment4633099_4272791)

    -- number of unique cards in hand; higher-rated kinds have fewer
    (length $ nub h,
    -- frequency of most common card, for differentiating between, e.g., three
    -- of a kind and two pair (both of which have three unique cards)
    negate $ maximum $ map length $ group $ sort h,
    -- handles lexicographic fallback sort using custom ordering (for when the
    -- first two features are the same for both cards)
    map (\c -> fromJust $ elemIndex c cards) h)

main = do
    content <- readFile "./input-7.txt"
    -- parse hands
    let hands = [(a, read b :: Int) | [a, b] <- (map words $ lines content)]
    -- perform descending sort using scoring criteria, multiply bids and ranks,
    -- sum result
    print $ sum $ zipWith (*) [1..] (map snd $ sortOn (Down . score . fst) hands)
    -- putStrLn $ intercalate "\n" $ map show (sortOn (Down $ score . fst) hands)
