module Demo () where

import Text.Show.Functions ()

type Poder = Personaje -> Personaje

data Personaje = UnPersonaje {
    nombre :: String,
    poderBasico :: Poder,
    superPoder :: Poder,
    superPoderActivo :: Bool,
    cantidadDeVida :: Int
} deriving (Show)

espina :: Personaje
espina = UnPersonaje "Espina" bolaEspinosa (granadaDeEspinas 5) True 4800

pamela :: Personaje
pamela = UnPersonaje "Pamela" (lluviaDeTuercas "sanadoras") torretaCurativa False 9600

bolaEspinosa :: Poder
bolaEspinosa personaje@(UnPersonaje { cantidadDeVida = vidaActual }) 
  | (vidaActual >= 1000) = personaje { cantidadDeVida = vidaActual - 1000 }
  | otherwise = personaje

granadaDeEspinas :: Int -> Personaje -> Personaje
granadaDeEspinas radioDeExplosion personaje@(UnPersonaje { nombre = nombreActual, cantidadDeVida = vidaActual })
  | (radioDeExplosion > 3 && vidaActual < 800) = personaje { nombre = nombreActual + " Espina estuvo aqui", cantidadDeVida = 0, superPoderActivo = False }
  | (radioDeExplosion > 3) = personaje { nombre = nombreActual + " Espina estuvo aqui" }
  | otherwise = bolaEspinosa personaje
