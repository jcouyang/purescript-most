module Most.Stream
       ( Stream ()
       , just
       ) where
import Data.Function.Uncurried (Fn2, runFn2)
import Prelude

foreign import data Stream :: * -> *

instance showStream :: Show (Stream a) where
  show = _show

instance functorStream :: Functor Stream where
  map = runFn2 _map

instance applyStream :: Apply Stream where
  apply = runFn2 ap
  
instance applicativeStream :: Applicative Stream where
  pure = just

instance bindStream :: Bind Stream where
  bind a b = runFn2 _flatMap b a

instance monadStream :: Monad Stream

instance semigroupStream :: Semigroup (Stream a) where
  append = runFn2 _concat

foreign import just :: forall a. a -> Stream a
foreign import _map :: forall a b. Fn2 (a -> b) (Stream a) (Stream b)
foreign import ap :: forall f a b. Fn2 (Stream (a -> b)) (Stream a) (Stream b)
foreign import _flatMap :: forall a b. Fn2 (a -> Stream b) (Stream a) (Stream b)
foreign import _concat :: forall a. Fn2 (Stream a) (Stream a) (Stream a)
foreign import _show :: forall a. (Stream a) -> String

