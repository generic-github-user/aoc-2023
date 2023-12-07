ways :: Int -> Int -> Int
ways t d = (length . filter (>d) . map (\x -> (t - x) * x)) [0..t]

-- TODO: can you get something resembling a closed-form solution?
-- x*(t-x) is just a quadratic, so we can probably just compute intersection points
main = do
    content <- readFile "input-6.txt"
    let inputs = map (tail . map read . words) $ lines content
    print $ product $ zipWith ways (inputs!!0) (inputs!!1)
