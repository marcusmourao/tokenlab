
<%@ page import="br.ufscar.tokenlab.Contact" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Agenda de Contatos</title>
	</head>
	<body>
		<a href="#list-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}">Página inicial</a></li>
				<li><g:link class="create" action="create">Criar novo contato</g:link></li>
			</ul>
		</div>
		<div id="list-contact" class="content scaffold-list" role="main">
			<h1>Agenda de Contatos</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'contact.name.label', default: 'Nome')}" />
						<g:sortableColumn property="birthday" title="${message(code: 'contact.birthday.label', default: 'Data de Aniversário')}" />
						<g:sortableColumn property="email" title="${message(code: 'contact.email.label', default: 'Email')}" />
						<g:sortableColumn property="address" title="${message(code: 'contact.address.label', default: 'Endereço')}" />
						<g:sortableColumn property="phone" title="${message(code: 'contact.phone.label', default: 'Telefone')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${contactInstanceList}" status="i" var="contactInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${contactInstance.id}">${fieldValue(bean: contactInstance, field: "name")}</g:link></td>
						<td><g:formatDate format="dd/MM/yyyy" date="${contactInstance.birthday}" /></td>
						<td>${fieldValue(bean: contactInstance, field: "email")}</td>
						<td>${fieldValue(bean: contactInstance, field: "address")}</td>
						<td>${fieldValue(bean: contactInstance, field: "phone")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contactInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
