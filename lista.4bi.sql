CREATE VIEW ListaAlunosCursos AS
SELECT alunos.nome AS Nome_Aluno, cursos.nome AS Nome_Curso, disciplinas.nome AS Nome_Disciplina
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
JOIN disciplinas ON matriculas.disciplina_id = disciplinas.id
JOIN cursos ON disciplinas.curso_id = cursos.id;

CREATE VIEW TotalAlunosPorDisciplina AS
SELECT disciplinas.nome AS Nome_Disciplina, COUNT(matriculas.aluno_id) AS Total_Alunos
FROM disciplinas
LEFT JOIN matriculas ON disciplinas.id = matriculas.disciplina_id
GROUP BY disciplinas.nome;

CREATE VIEW AlunosStatusMatricula AS
SELECT alunos.nome AS Nome_Aluno, disciplinas.nome AS Nome_Disciplina, matriculas.status AS Status_Matricula
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
JOIN disciplinas ON matriculas.disciplina_id = disciplinas.id;

CREATE VIEW ProfessoresTurmas AS
SELECT professores.nome AS Nome_Professor, disciplinas.nome AS Nome_Disciplina, turmas.horario AS Horario_Turma
FROM professores
JOIN turmas ON professores.id = turmas.professor_id
JOIN disciplinas ON turmas.disciplina_id = disciplinas.id;

CREATE VIEW AlunosMaioresDe20 AS
SELECT nome, data_nascimento
FROM alunos
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;

CREATE VIEW CargaHorariaPorCurso AS
SELECT cursos.nome AS Nome_Curso, COUNT(disciplinas.id) AS Total_Disciplinas, SUM(disciplinas.carga_horaria) AS Carga_Horaria_Total
FROM cursos
JOIN disciplinas ON cursos.id = disciplinas.curso_id
GROUP BY cursos.nome;

CREATE VIEW ProfessoresEspecialidades AS
SELECT nome, especialidade
FROM professores;

CREATE VIEW AlunosMaisDeUmaDisciplina AS
SELECT alunos.nome, COUNT(matriculas.disciplina_id) AS Total_Disciplinas
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome
HAVING COUNT(matriculas.disciplina_id) > 1;

CREATE VIEW AlunosDisciplinasConcluidas AS
SELECT alunos.nome AS Nome_Aluno, COUNT(matriculas.disciplina_id) AS Total_Disciplinas_Concluidas
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.status = 'Concluído'
GROUP BY alunos.nome;

CREATE VIEW TurmasPorSemestre AS
SELECT turmas.id AS Turma_ID, disciplinas.nome AS Nome_Disciplina, turmas.semestre
FROM turmas
JOIN disciplinas ON turmas.disciplina_id = disciplinas.id
WHERE turmas.semestre = '2024.1';

CREATE VIEW AlunosMatriculasTrancadas AS
SELECT alunos.nome AS Nome_Aluno
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.status = 'Trancado';

CREATE VIEW DisciplinasSemAlunos AS
SELECT disciplinas.nome AS Nome_Disciplina
FROM disciplinas
LEFT JOIN matriculas ON disciplinas.id = matriculas.disciplina_id
WHERE matriculas.aluno_id IS NULL;

CREATE VIEW AlunosPorStatusMatricula AS
SELECT matriculas.status AS Status_Matricula, COUNT(matriculas.aluno_id) AS Total_Alunos
FROM matriculas
GROUP BY matriculas.status;

CREATE VIEW TotalProfessoresPorEspecialidade AS
SELECT especialidade, COUNT(*) AS Total_Professores
FROM professores
GROUP BY especialidade;

CREATE VIEW AlunosIdades AS
SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS Idade
FROM alunos;

CREATE VIEW AlunosUltimasMatriculas AS
SELECT alunos.nome AS Nome_Aluno, MAX(matriculas.data_matricula) AS Ultima_Matricula
FROM alunos
JOIN matriculas ON alunos.id = matriculas.aluno_id
GROUP BY alunos.nome;

CREATE VIEW DisciplinasPorCurso AS
SELECT disciplinas.nome AS Nome_Disciplina, cursos.nome AS Nome_Curso
FROM disciplinas
JOIN cursos ON disciplinas.curso_id = cursos.id
WHERE cursos.nome = 'Engenharia de Software';

CREATE VIEW ProfessoresSemTurmas AS
SELECT professores.nome AS Nome_Professor
FROM professores
LEFT JOIN turmas ON professores.id = turmas.professor_id
WHERE turmas.id IS NULL;

CREATE VIEW AlunosCPFEmail AS
SELECT nome, cpf, email
FROM alunos;

CREATE VIEW TotalDisciplinasPorProfessor AS
SELECT professores.nome AS Nome_Professor, COUNT(turmas.disciplina_id) AS Total_Disciplinas
FROM professores
JOIN turmas ON professores.id = turmas.professor_id
GROUP BY professores.nome;
