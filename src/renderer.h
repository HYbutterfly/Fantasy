#ifndef RENDERER_H
#define RENDERER_H

#include "common.h"
#include "manager.h"


typedef struct
{
	Manager *manager;
	
	FT_Library ft;
	GLuint vao;
	GLuint vbo;
	GLuint ebo;
	GLuint cur_texture;

	uint32_t drawc;

	void(*draw)(float *, GLuint);
	void(*commit)(void);
	void(*destroy)(void);
} Renderer;



Renderer *
create_renderer();

#endif