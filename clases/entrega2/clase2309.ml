(* Clase laboratorio 23-09 *)
Segunda etapa: codigo intermedio

AST  ______________________   FRAGMENTOS   ___________  FRAGMENTOS
--> | TIPADO/              | -----------> |CANONIZADOR| -------------> ----
    | GENERACION DE CODIGO |               '''''''''''   CANONIZADOS. '-----> [INTERPRETE]
    |______________________|





Archivos nuevos:
  frame, pila:
    tigerframe.sig/sml -> cosas que dependen de la máquina
                          Ej: ¿Cuántos bytes tiene una palabra?
                              ¿ Dónde devuelve una función su resultado?
                              En general: Este módilo conoce la máqiuna de destino, pero no el lenguaje fuente. 
    tigerpila.sig/sml -> Implementa una pila para los breaks
    
    
  Generación de códigp
        tigertrans.sig/sml -> completar
              traducción de expresiones del AST a tree.sml o tree.exp
            
            
        En general: tigertrans no conoce la máquina de destino, pero sí el lenguaje fuente
        
  Ejemplo: tigerframe.frame
           tigertrans.level
    
    tigerframe.formals:frame -> access list
    tigertrans.formals:level -> access list
    Tree:
          tigertree.sml
          tigerit.sml
    Canonizador:
          tigercanon.sig/sml
    Interprete:
          tigerinterp.sml
          
    Archivos modificados:
      tigersres.sml: hay más cosas para guardar en la tabla de variables y funciones
      tigerseman.sml: hay algunas cosas extra.
            
        
        
  
