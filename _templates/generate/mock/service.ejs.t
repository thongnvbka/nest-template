---
to: src/apis/<%= name %>/__mocks__/<%= name %>.service.ts
---
import { PaginationDto } from '@common';
import { v4 as uuidv4 } from 'uuid';
import { Create<%= h.inflection.camelize(name) %>Input } from '../dto/create-<%= name %>.input';
import { Update<%= h.inflection.camelize(name) %>ByIdInput } from '../dto/update-<%= name %>-by-id.input';

export const <%= h.inflection.camelize(name) %>Service = jest.fn().mockReturnValue({
	create: jest.fn((dto: Create<%= h.inflection.camelize(name) %>Input) => ({
		...dto,
		id: uuidv4(),
		createdAt: new Date(),
		updatedAt: new Date()
	})),
	getAllPaginated: jest.fn((query: PaginationDto) => {
		const data = [
			{
				id: uuidv4(),
				createdAt: new Date(),
				updatedAt: new Date()
			},
			{
				id: uuidv4(),
				createdAt: new Date(),
				updatedAt: new Date()
			}
		];
		const limit = +(query.limit || 10);
		const page = +(query.page || 10);
		const offset = limit * (page - 1);
		const total = data.length;
		return {
			data: data.slice(offset, limit * page),
			pagination: {
				limit,
				page,
				total
			}
		};
	}),
	getOneByIdOrFail: jest.fn((id: string) => ({
		id,
		createdAt: new Date(),
		updatedAt: new Date()
	})),
	softRemoveById: jest.fn((id: string) => ({
		id,
		createdAt: new Date(),
		updatedAt: new Date()
	})),
	updateById: jest.fn((id: string, data: Update<%= h.inflection.camelize(name) %>ByIdInput) => ({
		...data,
		id,
		createdAt: new Date(),
		updatedAt: new Date()
	}))
});
