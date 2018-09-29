/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vduong <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/09/29 11:57:53 by vduong            #+#    #+#             */
/*   Updated: 2018/09/29 11:57:56 by vduong           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "ft_printf.h"
#include <limits.h>
#include <locale.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <wchar.h>

#define TEST	"%zd", LLONG_MAX

int		main(void)
{
	unsigned int	i;
	void			*p;
	wchar_t			*str;
	wchar_t			c;
	wchar_t			*s;

	setlocale(LC_ALL, "");
	i = 0;
	p = &i;
	s = L"S„™ºÚÅÄÄS„";
	str = L"S˛";
	c = L'˛';
	printf("[%d]\n", printf(TEST));
	printf("{%d}\n", ft_printf(TEST));
	return (i);
}
