import Data.Sort
import Data.List
import Data.Maybe
import Data.Ord

-- used for generating an ordering on hands
score :: String -> (Int, Int, [Int])
score h = let cards = "AKQT98765432J"; h2 = filter (/='J') h in
    -- TODO: clean up...
    -- number of unique cards in hand; higher-rated kinds have fewer; if hand
    -- contains jokers (but not only jokers), unique card count decreases by
    -- one
    ((length $ nub h) - (if (elem 'J' h && h2 /= []) then 1 else 0),
    -- frequency of most common card, for differentiating between, e.g., three
    -- of a kind and two pair (both of which have three unique cards); add
    -- number of jokers to frequency of second most common card (or 0 if hand
    -- is only jokers)
    negate $ ((if h2 == [] then 0 else maximum $ map length $ group $ sort h2)
        + (length $ filter (=='J') h)), -- more concise options?
    -- handles lexicographic fallback sort using custom ordering (for when the
    -- first two features are the same for both cards); unchanged from pt. 1
    map (\c -> fromJust $ elemIndex c cards) h)

main = do
    content <- readFile "./input-7.txt"
    -- parse hands
    let hands = [(a, read b :: Int) | [a, b] <- (map words $ lines content)]
    -- perform descending sort using scoring criteria, multiply bids and ranks,
    -- sum result
    print $ sum $ zipWith (*) [1..] (map snd $ sortOn (Down . score . fst) hands)
