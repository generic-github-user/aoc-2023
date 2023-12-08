import Data.Sort
import Data.List
import Data.Maybe
import Data.Ord

-- used for generating an ordering on hands
score :: String -> (Int, Int, [Int])
score h = let cards = "AKQJT98765432" in
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
    -- for debugging
    -- putStrLn $ intercalate "\n" $ map show (sortOn (Down $ score . fst) hands)
