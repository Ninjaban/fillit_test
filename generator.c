#include <unistd.h>
#include <stdlib.h>

#define NEWLINE_1		4
#define NEWLINE_2		9
#define NEWLINE_3		14
#define NEWLINE_4		19

typedef struct	s_coord {
	char		x;
	char		y;
}				t_coord;

typedef struct	s_type {
	char		pos1;
	char		pos2;
	char		pos3;
	char		pos4;
	t_coord		size;
}				t_type;

static t_type	types[19];

static void		ft_init_types(char nbr, char pos1, char pos2, char pos3, char pos4,
								char sizex, char sizey)
{
	types[nbr].pos1 = pos1;
	types[nbr].pos2 = pos2;
	types[nbr].pos3 = pos3;
	types[nbr].pos4 = pos4;
	types[nbr].size.x = sizex;
	types[nbr].size.y = sizey;
}

static void		ft_init(void)
{
	ft_init_types(0, 0, 1, 5, 6, 2, 2);
	ft_init_types(1, 0, 1, 2, 3, 4, 1);
	ft_init_types(2, 0, 5, 10, 15, 1, 4);
	ft_init_types(3, 0, 5, 6, 7, 3, 2);
	ft_init_types(4, 0, 1, 5, 10, 2, 3);
	ft_init_types(5, 0, 1, 2, 7, 3, 2);
	ft_init_types(6, 1, 6, 10, 11, 2, 3);
	ft_init_types(7, 2, 5, 6, 7, 3, 2);
	ft_init_types(8, 0, 1, 6, 11, 2, 3);
	ft_init_types(9, 0, 1, 2, 5, 3, 2);
	ft_init_types(10, 0, 5, 10, 11, 2, 3);
	ft_init_types(11, 1, 5, 6, 7, 3, 2);
	ft_init_types(12, 0, 5, 6, 10, 2, 3);
	ft_init_types(13, 0, 1, 2, 6, 3, 2);
	ft_init_types(14, 1, 5, 6, 11, 2, 3);
	ft_init_types(15, 0, 1, 6, 7, 3, 2);
	ft_init_types(16, 1, 5, 6, 10, 2, 3);
	ft_init_types(17, 1, 2, 5, 6, 3, 2);
	ft_init_types(18, 0, 5, 6, 11, 2, 3);
}

static int		ft_get_limit(int n)
{
	if (n < NEWLINE_1)
		return (NEWLINE_1);
	if (n < NEWLINE_2)
		return (NEWLINE_2);
	if (n < NEWLINE_3)
		return (NEWLINE_3);
	return (NEWLINE_4);
}

static void		ft_update_pos(int type, int pos)
{
	int		n;

	n = 0;
	while (pos--)
	{
		n = n + 1;
		if (n + types[type].size.x - 1 >= ft_get_limit(n))
			n = ft_get_limit(n) + 1;
		if (n + ((types[type].size.y - 1) * 5) >= NEWLINE_4)
		{
			n = NEWLINE_4 - ((types[type].size.y - 1) * 5) - types[type].size.x;
			break;
		}
	}

	types[type].pos1 += n;
	types[type].pos2 += n;
	types[type].pos3 += n;
	types[type].pos4 += n;
}

/*
**	Usage : ./generator [type] [position]
*/
int				main(int ac, char **av)
{
	char	str[20];
	int		type;
	int		pos;

	if (ac != 3)
		return (1);

	str[NEWLINE_1] = '\n';
	str[NEWLINE_2] = '\n';
	str[NEWLINE_3] = '\n';
	str[NEWLINE_4] = '\n';

	ft_init();

	type = atoi(av[1]) - 1;
	pos = atoi(av[2]);

	for (int n = 0 ; n < 4 ; ++ n)
		for (int i = (5 * n) ; i < (5 * n + 4) ; ++ i)
			str[i] = '.';

	ft_update_pos(type, pos);
	str[types[type].pos1] = '#';
	str[types[type].pos2] = '#';
	str[types[type].pos3] = '#';
	str[types[type].pos4] = '#';

	write(1, str, 20);
	return (0);
}