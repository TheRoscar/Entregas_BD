-- Registros para la tabla planeta
INSERT INTO planeta (nombre_planeta) VALUES 
('Marte'),
('Júpiter'),
('Saturno'),
('Próxima Centauri b'),
('Kepler-452b'),
('Titán'),
('Europa'),
('Tatooine'),
('Arrakis'),
('Cybertron');


-- Registros para la tabla nave
INSERT INTO nave (nombre_nave, capacidad, asiento) VALUES 
-- Naves de carga pesada (mucha capacidad, pocos asientos)
('Carguero Goliath mk1', 50000, 4),
('Transporte Nostromo', 45000, 7),

-- Naves de exploración científica (capacidad media, tripulación pequeña)
('USS Enterprise', 5000, 400),
('Prometheus X', 2000, 15),
('Voyager VI', 1500, 6),

-- Naves de transporte rápido (poca carga, varios asientos o monoplazas)
('Halcón Milenario', 800, 6),
('Caza TIE', 0, 1),
('Transbordador Apolo', 100, 3),
('Interceptor Omega', 50, 2),
('Crucero Estelar', 12000, 2500);

