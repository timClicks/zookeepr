<h2>Edit proposal "<% c.proposal.title %>"</h2>

<div id="proposal">

% if c.paper_editing == 'closed':
<p>Editing has been disabled while proposals are reviewed. If your paper is successful in its submission, you will be able to update your details later when the schedule is finalised.</p>
% else:

<&| @zookeepr.lib.form:fill, defaults=defaults, errors=errors &>

<% h.form(h.url()) %>
% if c.proposal.type.name == 'Miniconf':
<& form_mini.myt &>
% else:
<& form.myt &>
% #endif

<p class="submit">
<% h.submitbutton('Update') %>
</p>

<% h.end_form() %>

</&>
% #endif
</div>

<%args>
defaults
errors
</%args>

<%init>
# Working around a bug in formencode, we need to set the defaults to the c.proposal
# values
#
# 13.6.2007 (IM between sabik & johnf):
# (17:19:32) sabik: Would you remember the nature of the bug and/or how I
# need to take it into account when I change the form?
# (17:21:29) johnf: jaq fixed that but I know whenever I've
# changed a form I've had to add its elements to that it of code
# (17:22:09) sabik: OK, I guess I can just do that too...

if not defaults and c.proposal:
    defaults = {
        'proposal.title': c.proposal.title,
        'proposal.abstract': c.proposal.abstract,
        'proposal.project': c.proposal.project,
        'proposal.url': c.proposal.url,
        'proposal.abstract_video_url': c.proposal.abstract_video_url,
        'person.mobile': c.person.mobile,
        'person.url': c.person.url,
        'person.experience': c.person.experience,
        'person.bio': c.person.bio,
    }
    if c.proposal.type:
        defaults['proposal.type'] = c.proposal.type.id
    if c.proposal.accommodation_assistance:
        defaults['proposal.accommodation_assistance'] = c.proposal.accommodation_assistance.id
    if c.proposal.travel_assistance:
        defaults['proposal.travel_assistance'] = c.proposal.travel_assistance.id

</%init>
