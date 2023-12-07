import Data.List
import Data.Ord
import Data.List.Split

parseBlock :: [String] -> (Integer -> Integer)
parseBlock b =
    let slices = map (map read . splitOn " ") (tail b)
    in \x -> let valid = filter ((<=x) . (!!1)) slices
                 -- m = if (null valid) then  else (maximumBy (!!1) valid)
        in (if (null valid) then x
            -- compare `on` vs. comparing?
            else (let m = maximumBy (comparing (!!1)) valid in
            if (x>=m!!1+m!!2) then x else m!!0+x-m!!1))

main = do
    content <- readFile "./input-5.txt"
    let l = lines content
    print $ minimum $
        map (foldl1 (flip (.)) $ map parseBlock $ splitOn [""] $ (drop 2 l))
        (map read $ splitOn " " $ drop 7 $ head l)
