ways :: Int -> Int -> Int
ways t d = (length . filter (>d) . map (\x -> (t - x) * x)) [0..t]

main = do
    content <- readFile "input-6.txt"
    let inputs = map (read . concat . tail . words) $ lines content
    print $ ways (inputs!!0) (inputs!!1)
