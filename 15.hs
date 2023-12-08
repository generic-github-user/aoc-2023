import Data.List.Split
import Data.Char
import qualified Data.Map as M

traverse_ m "ZZZ" dirs = 0
traverse_ m pos dirs = let next = m M.! pos in
    1 + traverse_ m (if head dirs == 'L' then (fst next) else (snd next)) (tail dirs)

main = do
    content <- readFile "./input-8.txt"
    let d:_:rest = lines content
    print $ traverse_
        (M.fromList $ map ((\[a, b, c] -> (a, (b, c))) . wordsBy (not . isAlpha)) rest)
        "AAA" (cycle d)
